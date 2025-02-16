
{{- define "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.fullname" -}}
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


{{- define "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.labels" -}}
helm.sh/chart: {{ include "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.chart" . }}
{{ include "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa47f1474-07e4-4a86-b89b-4ac200729deb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}