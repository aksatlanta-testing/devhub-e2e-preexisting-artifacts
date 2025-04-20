
{{- define "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.fullname" -}}
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


{{- define "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.labels" -}}
helm.sh/chart: {{ include "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.chart" . }}
{{ include "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9fd64c83-a1f9-4a74-9ed6-d36e6c6cd152.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}