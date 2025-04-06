
{{- define "go-echoc8748970-247b-4e89-b6ea-8752ef155772.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8748970-247b-4e89-b6ea-8752ef155772.fullname" -}}
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


{{- define "go-echoc8748970-247b-4e89-b6ea-8752ef155772.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8748970-247b-4e89-b6ea-8752ef155772.labels" -}}
helm.sh/chart: {{ include "go-echoc8748970-247b-4e89-b6ea-8752ef155772.chart" . }}
{{ include "go-echoc8748970-247b-4e89-b6ea-8752ef155772.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8748970-247b-4e89-b6ea-8752ef155772.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8748970-247b-4e89-b6ea-8752ef155772.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}