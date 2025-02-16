
{{- define "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.fullname" -}}
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


{{- define "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.labels" -}}
helm.sh/chart: {{ include "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.chart" . }}
{{ include "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob10ea2a9-d4b8-4d46-8cd3-9701c0881f43.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}