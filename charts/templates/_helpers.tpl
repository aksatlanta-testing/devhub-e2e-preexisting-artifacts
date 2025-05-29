
{{- define "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.fullname" -}}
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


{{- define "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.labels" -}}
helm.sh/chart: {{ include "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.chart" . }}
{{ include "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfb52dd4-a8b1-4942-8199-b4437fa3d700.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}