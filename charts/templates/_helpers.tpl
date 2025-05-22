
{{- define "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.fullname" -}}
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


{{- define "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.labels" -}}
helm.sh/chart: {{ include "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.chart" . }}
{{ include "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2bc1f3a9-ddb1-483a-9d32-58dcda228fcc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}