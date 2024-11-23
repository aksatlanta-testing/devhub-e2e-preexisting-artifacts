
{{- define "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.labels" -}}
helm.sh/chart: {{ include "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.chart" . }}
{{ include "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe41a1b43-8440-4b44-a94e-87468fa0c22c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}