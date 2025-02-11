
{{- define "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.fullname" -}}
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


{{- define "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.labels" -}}
helm.sh/chart: {{ include "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.chart" . }}
{{ include "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3c8e902-1315-457a-b5c5-247b4b48d949.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}