
{{- define "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.fullname" -}}
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


{{- define "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.labels" -}}
helm.sh/chart: {{ include "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.chart" . }}
{{ include "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4e2cb319-2d12-46a1-b295-359b8bd15c1f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}