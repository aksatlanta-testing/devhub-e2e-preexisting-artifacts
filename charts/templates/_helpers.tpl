
{{- define "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.fullname" -}}
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


{{- define "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.labels" -}}
helm.sh/chart: {{ include "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.chart" . }}
{{ include "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5c1804e-64c5-4f13-9878-9fb9993f0355.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}