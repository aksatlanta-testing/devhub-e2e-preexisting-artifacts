
{{- define "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.fullname" -}}
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


{{- define "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.labels" -}}
helm.sh/chart: {{ include "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.chart" . }}
{{ include "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoded0d85d-b9b0-48b3-95ee-68c17bfc692a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}