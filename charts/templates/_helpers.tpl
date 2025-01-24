
{{- define "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.fullname" -}}
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


{{- define "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.labels" -}}
helm.sh/chart: {{ include "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.chart" . }}
{{ include "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5dff5d0d-0ed8-4e89-92c4-ea6756087cde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}